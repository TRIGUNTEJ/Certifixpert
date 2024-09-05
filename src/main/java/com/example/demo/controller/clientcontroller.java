package com.example.demo.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.entity.Admin;
import com.example.demo.entity.AdminCertifications;
import com.example.demo.entity.Client;
import com.example.demo.entity.Subscription;
import com.example.demo.entity.certifications;
import com.example.demo.repository.AdminCertificationRepository;
import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.CertificationRepository;
import com.example.demo.repository.ClientRepository;
import com.example.demo.repository.SubscriptionRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class clientcontroller {
    @Autowired
    private CertificationRepository certificationRepository;

    @Autowired
    private AdminCertificationRepository admincertificationRepository;

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private SubscriptionRepository subscriptionRepository;

    @Value("${razorpay.keyId}")
    private String razorpayKeyId;

    @Value("${razorpay.keySecret}")
    private String razorpayKeySecret; 


    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) {
        Client loggedInClient = (Client) session.getAttribute("loggedInClient");
        if (loggedInClient != null) {
            List<certifications> certificationsList = certificationRepository.findAll();
            certificationsList.sort(Comparator.comparingInt(certifications::getViews).reversed());
            List<Subscription> unverifiedSubscriptions = subscriptionRepository.findByclientEmailAndVerified(loggedInClient.getEmail(), "yes");
            List<certifications> filteredCertifications = certificationsList.stream()
                    .filter(cert -> cert.getViews() > 0)
                    .collect(Collectors.toList());
            model.addAttribute("client", loggedInClient);
            model.addAttribute("certifications", filteredCertifications);
            model.addAttribute("unverifiedSubscriptions", unverifiedSubscriptions);
            return "dashboard";
        } else {
            return "redirect:/";
        }
    }
    @GetMapping("/searchSuggestions")
    @ResponseBody
    public List<certifications> searchSuggestions(@RequestParam String query) {
        List<certifications> certifications = certificationRepository.findByCertificationNameContainingIgnoreCaseOrOrganizationNameContainingIgnoreCase(query, query);
        return certifications;
    }

    @PostMapping("/client/verifySubscription/{id}")
	public String verifySubscription(@PathVariable Long id, HttpSession session) {
		Optional<Subscription> subscriptionOptional = subscriptionRepository.findById(id);
		if (subscriptionOptional.isPresent()) {
			Subscription subscription = subscriptionOptional.get();
			subscription.setVerified("completed");
			subscriptionRepository.save(subscription);
		} else {
			return "redirect:/admin/dashboard";
		}
		return "redirect:/admin/dashboard";
	}

    @GetMapping("/client/catalog")
    public String clientCatalog(Model model, HttpSession session) {
        Client loggedInClient = (Client) session.getAttribute("loggedInClient");
        if (loggedInClient != null) {
            List<certifications> certificationsList = certificationRepository.findAll();
            model.addAttribute("client", loggedInClient);
            model.addAttribute("certifications", certificationsList);
            return "catalog";
        } else {
            return "redirect:/";
        }
    }

    @GetMapping("/client/view/certification/{certificationName}")
    public String viewCertification(@PathVariable String certificationName, HttpSession session, Model model) {
        Client loggedInClient = (Client) session.getAttribute("loggedInClient");
        if (loggedInClient != null) {
            List<AdminCertifications> certificationsList = admincertificationRepository.findByCertificationName(certificationName);
            certifications certification = certificationRepository.findByCertificationName(certificationName);

            if (certification != null) {
                certification.setViews(certification.getViews() + 1); 
                certificationRepository.save(certification); 

                List<CertificationWithAdmin> certsWithAdmins = new ArrayList<>();
                for (AdminCertifications cert : certificationsList) {
                    Admin admin = adminRepository.findByEmail(cert.getEmail());
                    certsWithAdmins.add(new CertificationWithAdmin(cert, admin));
                }

                Optional<Subscription> existingSubscription = subscriptionRepository.findByClientEmailAndCertificationName(loggedInClient.getEmail(), certificationName);
                boolean isSubscribed = existingSubscription.isPresent();
                boolean isVerified = isSubscribed && ("yes".equals(existingSubscription.get().getVerified()) || "completed".equals(existingSubscription.get().getVerified()));

                model.addAttribute("client", loggedInClient);
                model.addAttribute("certification", certification);
                model.addAttribute("certifications", certsWithAdmins);
                model.addAttribute("isSubscribed", isSubscribed);
                model.addAttribute("isVerified", isVerified);
                return "view";
            } else {
                return "redirect:/client/catalog";
            }
        } else {
            return "redirect:/client/catalog";
        }
    }

    @GetMapping("/client/view/count/{certificationName}")
    @ResponseBody
    public int getCertificationViewCount(@PathVariable String certificationName) {
        certifications cert = certificationRepository.findByCertificationName(certificationName);
        return cert != null ? cert.getViews() : 0;
    }

    public static class CertificationWithAdmin {
        private AdminCertifications certification;
        private Admin admin;
        private int percentage;

        public CertificationWithAdmin(AdminCertifications certification, Admin admin) {
            this.certification = certification;
            this.admin = admin;
            this.percentage = (int) ((certification.getMarksScored() * 100) / certification.getTotalmarks());
        }

        public AdminCertifications getCertification() {
            return certification;
        }

        public Admin getAdmin() {
            return admin;
        }

        public int getPercentage() {
            return percentage;
        }
    }
    @GetMapping("/client/profile")
    public String viewProfile(HttpSession session, Model model) {
        Client loggedInClient = (Client) session.getAttribute("loggedInClient");
        if (loggedInClient != null) {
            List<Subscription> certificationsList = subscriptionRepository.findByClientEmail(loggedInClient.getEmail()); 
            model.addAttribute("client", loggedInClient);
            model.addAttribute("certifications", certificationsList); 
            return "profile"; 
        } else {
            return "redirect:/";
        }
    }


	@PostMapping("/client/updateProfile")
	public String updateProfile(@RequestParam(name = "name", required = false) String name,
	                            @RequestParam(name = "contactNumber", required = false) String contactNumber,
	                            HttpSession session) {
        Client loggedInClient = (Client) session.getAttribute("loggedInClient");
	    
	    if (name != null) {
	        loggedInClient.setName(name);
	    }
	    if (contactNumber != null) {
	        loggedInClient.setContactNumber(contactNumber);
	    }
	    clientRepository.save(loggedInClient);
	    session.setAttribute("loggedInClient", loggedInClient);

	    return "redirect:/client/profile";
	}
    @PostMapping("/client/subscribe")
    public String subscribeClientWithPayment(
            @RequestParam("clientName") String clientName,
            @RequestParam("clientEmail") String clientEmail,
            @RequestParam("clientContact") String clientContact,
            @RequestParam("certificationName") String certificationName,
            @RequestParam("organizationName") String organizationName,
            @RequestParam("adminEmails") List<String> adminEmails,
            @RequestParam("razorpayPaymentId") String razorpayPaymentId, // New parameter for Razorpay payment ID
            Model model) {

        LocalDateTime subscriptionDateTime = LocalDateTime.now();

        if (clientName == null || clientEmail == null || clientContact == null || adminEmails == null ||
                certificationName == null || organizationName == null || adminEmails.isEmpty()) {
            model.addAttribute("error", "Invalid subscription data");
            return "error";
        }

        Optional<Subscription> existingSubscription = subscriptionRepository.findByClientEmailAndCertificationName(clientEmail, certificationName);
        if (existingSubscription.isPresent()) {
            // If already subscribed, show a message and redirect to profile
            model.addAttribute("message", "Already subscribed to this certification.");
            return "redirect:/client/profile";
        }

        Random random = new Random();
        int randomIndex = random.nextInt(adminEmails.size());
        String randomAdminEmail = adminEmails.get(randomIndex);

        Subscription subscription = new Subscription();
        subscription.setClientName(clientName);
        subscription.setClientEmail(clientEmail);
        subscription.setClientContact(clientContact);
        subscription.setAdminEmails(randomAdminEmail);
        subscription.setCertificationName(certificationName);
        subscription.setOrganizationName(organizationName);
        subscription.setSubscriptionDateTime(subscriptionDateTime);
        subscription.setVerified("no");
        subscription.setRazorpayPaymentId(razorpayPaymentId);
        subscriptionRepository.save(subscription);

        model.addAttribute("message", "Subscribed successfully");
        return "redirect:/client/profile";
    }

}
