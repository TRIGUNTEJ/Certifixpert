package com.example.demo.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.AdminCertifications;
import com.example.demo.entity.Subscription;
import com.example.demo.entity.Admin;
import com.example.demo.entity.certifications;
import com.example.demo.repository.AdminCertificationRepository;
import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.CertificationRepository;
import com.example.demo.repository.SubscriptionRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.http.HttpSession;

@Controller
public class admincontroller {
	
	@Autowired
    private AdminRepository adminRepository;
	
	@Autowired
    private CertificationRepository certificationRepository;
	
	@Autowired
    private AdminCertificationRepository admincertificationRepository;

	@Autowired
    private SubscriptionRepository subscriptionRepository;
	
	@PersistenceContext
    private EntityManager entityManager;
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	

    @GetMapping("/admin/dashboard")
	public String adminDashboard(Model model, HttpSession session) {
		Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
		if (loggedInAdmin != null) {
			List<Subscription> unverifiedSubscriptions = subscriptionRepository.findByAdminEmailsAndVerified(loggedInAdmin.getEmail(), "no");
			model.addAttribute("admin", loggedInAdmin);
			model.addAttribute("unverifiedSubscriptions", unverifiedSubscriptions);
			return "admin_dash";
		} else {
			return "redirect:/";
		}
	}
	@PostMapping("/admin/verifySubscription/{id}")
	public String verifySubscription(@PathVariable Long id, HttpSession session) {
		Optional<Subscription> subscriptionOptional = subscriptionRepository.findById(id);
		if (subscriptionOptional.isPresent()) {
			Subscription subscription = subscriptionOptional.get();
			subscription.setVerified("yes");
			subscriptionRepository.save(subscription);
		} else {
			return "redirect:/admin/dashboard";
		}
		return "redirect:/admin/dashboard";
	}



	@PostMapping("/admin/register")
	public String register(@RequestParam String email, @RequestParam String password, Model model) {
	    if (adminRepository.findByEmail(email) != null) {
	        model.addAttribute("error", "Email is already registered");
	        return "redirect:/admin/dashboard";
	    }

	    Admin newAdmin = new Admin();
	    newAdmin.setEmail(email);
	    newAdmin.setPassword(password);
	    
	    String name = email.split("@")[0];
	    newAdmin.setName(name);
	    newAdmin.setContactNumber("Enter new number");
	    newAdmin.setWorkExperience("0");
	    newAdmin.setNumberOfCertifications(0);

	    adminRepository.save(newAdmin);

	    return "redirect:/admin/dashboard";
	}

	
	@GetMapping("/admin/catalog")
	public String adminCatalog(Model model, HttpSession session) {
	    // Check if the admin is logged in
	    Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
	    if (loggedInAdmin != null) {
	        // Fetch certifications from the database
	        List<certifications> certificationsList = certificationRepository.findAll(); 
	        model.addAttribute("admin", loggedInAdmin);
	        model.addAttribute("certifications", certificationsList);
	        return "admin_catalog"; 
	    } else {
	        return "redirect:/";
	    }
	}

	@PostMapping("/add/certification")
    public String addCertification(@RequestParam("organizationName") String organizationName,
                                   @RequestParam("certificationName") String certificationName,
                                   @RequestParam("certificationCode") String certificationCode,
                                   @RequestParam("certificationLevel") String certificationLevel,
                                   @RequestParam("examFormat") String examFormat,
                                   @RequestParam("duration") String duration,
                                   @RequestParam("passingScore") String passingScore,
                                   @RequestParam("validityPeriod") String validityPeriod,
                                   @RequestParam("Cost") String cost,
                                   @RequestParam("validityPeriod") String voucherAvailabilty,
                                   @RequestParam("description1") String description1,
                                   @RequestParam("description2") String description2,
                                   @RequestParam("description3") String description3,
								   @RequestParam("subcribeCost") String subcribeCost,
                                   RedirectAttributes redirectAttributes) {
            certifications certification = new certifications();
            certification.setOrganizationName(organizationName);
            certification.setCertificationName(certificationName);
            certification.setCertificationCode(certificationCode);
            certification.setCertificationLevel(certificationLevel);
            certification.setExamFormat(examFormat);
            certification.setDuration(duration);
            certification.setPassingScore(passingScore);
            certification.setValidityPeriod(validityPeriod);
            certification.setCost(cost);
            certification.setVoucherAvailabilty(voucherAvailabilty);
            certification.setDescription1(description1);
            certification.setDescription2(description2);
            certification.setDescription3(description3);
			certification.setSubcribeCost(subcribeCost);

            certificationRepository.save(certification);
            return "redirect:/admin/catalog";
    }
	@GetMapping("/delete/certification/{certificationName}")
    public String deleteCertification(@PathVariable String certificationName) {
		String certification_name = certificationName;
        String sql = "DELETE FROM certifications WHERE certification_name = ?";
        int rowsAffected = jdbcTemplate.update(sql, certification_name);
        if (rowsAffected > 0) {
            return "redirect:/admin/catalog";
        } else {
            return "redirect:/error";
        }
    }
	
	@GetMapping("/admin/view/certification/{certificationName}")
		public String viewCertification(@PathVariable String certificationName, HttpSession session, Model model) {
			Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
			if (loggedInAdmin != null) {
				List<AdminCertifications> certificationsList = admincertificationRepository.findByCertificationName(certificationName);
				certifications certification = certificationRepository.findByCertificationName(certificationName);

				List<CertificationWithAdmin> certsWithAdmins = new ArrayList<>();
				for (AdminCertifications cert : certificationsList) {
					Admin admin = adminRepository.findByEmail(cert.getEmail());
					certsWithAdmins.add(new CertificationWithAdmin(cert, admin));
				}
				List<Subscription> subscriptionList = subscriptionRepository.findByCertificationName(certificationName); 
				model.addAttribute("admin", loggedInAdmin);
				if (certification != null) {
					model.addAttribute("certification", certification);
					model.addAttribute("certifications", certsWithAdmins);
					model.addAttribute("subscriptions", subscriptionList); 
					return "admin_view";
				} else {
					return "redirect:/admin/catalog";
				}
			} else {
				return "redirect:/admin/catalog";
			}
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
		

	@GetMapping("/admin/profile")
	public String viewProfile(HttpSession session, Model model) {
		Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
		if (loggedInAdmin != null) {
			List<AdminCertifications> certificationsList = admincertificationRepository.findByEmail(loggedInAdmin.getEmail()); 
			model.addAttribute("admin", loggedInAdmin);
			model.addAttribute("certifications", certificationsList);
			return "admin_profile"; 
		} else {
			return "redirect:/";
		}
	}

	@PostMapping("/admin/updateProfile")
	public String updateProfile(@RequestParam(name = "name", required = false) String name,
	                            @RequestParam(name = "contactNumber", required = false) String contactNumber,
	                            @RequestParam(name = "workExperience", required = false) String workExperience,
	                            @RequestParam(name = "numberOfCertifications", required = false) Integer numberOfCertifications,
	                            HttpSession session) {
	    Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
	    
	    if (name != null) {
	        loggedInAdmin.setName(name);
	    }
	    if (contactNumber != null) {
	        loggedInAdmin.setContactNumber(contactNumber);
	    }
	    if (workExperience != null) {
	        loggedInAdmin.setWorkExperience(workExperience);
	    }
	    if (numberOfCertifications != null) {
	        loggedInAdmin.setNumberOfCertifications(numberOfCertifications);
	    }

	    adminRepository.save(loggedInAdmin);
	    session.setAttribute("loggedInAdmin", loggedInAdmin);

	    return "redirect:/admin/profile";
	}
	@PostMapping("/admin/add-admin-cert")
	public String addCertification(@RequestParam("organizationName") String organizationName,
	                               @RequestParam("certificationName") String certificationName,
	                               @RequestParam("certificationCode") String certificationCode,
	                               @RequestParam("marksScored") double marksScored,
	                               @RequestParam("totalmarks") double totalmarks,
	                               @RequestParam("yearOfCertified") int yearOfCertified,
	                               @RequestParam("certificateId") String certificateId,
	                               HttpSession session,
	                               RedirectAttributes redirectAttributes) {
	    com.example.demo.entity.Admin loggedInAdmin = (com.example.demo.entity.Admin) session.getAttribute("loggedInAdmin");
	    String email = loggedInAdmin.getEmail();

	    AdminCertifications certification = new AdminCertifications();
	    certification.setEmail(email);
	    certification.setOrganizationName(organizationName);
	    certification.setCertificationName(certificationName);
	    certification.setCertificationCode(certificationCode);
	    certification.setMarksScored(marksScored);
	    certification.setTotalmarks(totalmarks);
	    certification.setYearOfCertified(yearOfCertified);
	    certification.setCertificateId(certificateId);

	    admincertificationRepository.save(certification);

	    return "redirect:/admin/profile";
	}
	@GetMapping("/admin/profile/selectCertification")
	public String selectCertification(@RequestParam("email") String email, @RequestParam("certificationName") String certificationName, HttpSession session, Model model) throws UnsupportedEncodingException {
		Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
		if (loggedInAdmin != null && loggedInAdmin.getEmail().equals(email)) {
			List<AdminCertifications> certificationsList = admincertificationRepository.findByEmail(loggedInAdmin.getEmail()); 
			model.addAttribute("admin", loggedInAdmin);
			model.addAttribute("certifications", certificationsList);

			// Decode the certification name
			String decodedCertificationName = URLDecoder.decode(certificationName, "UTF-8");

			AdminCertifications selectedCertification = certificationsList.stream()
					.filter(cert -> cert.getCertificationName().equals(decodedCertificationName))
					.findFirst()
					.orElse(null);
			model.addAttribute("selectedCertification", selectedCertification);

			return "admin_profile"; 
		} else {
			return "redirect:/";
		}
	}
}
