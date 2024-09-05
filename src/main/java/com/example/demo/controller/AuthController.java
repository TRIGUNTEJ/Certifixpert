package com.example.demo.controller;

import com.example.demo.entity.Client;
import com.example.demo.entity.Admin;
import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.ClientRepository;

import java.security.SecureRandom;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private AdminRepository adminRepository;

    @GetMapping("/")
    public String home(Model model, HttpSession session) {
        if (session.getAttribute("loggedInClient") != null) {
            return "redirect:/dashboard";
        } else if (session.getAttribute("loggedInAdmin") != null) {
            return "redirect:/admin/dashboard";
        }
        model.addAttribute("error", "");
        return "home";
    }

    @GetMapping("/google-signin")
    public String firebase(Model model) {
        model.addAttribute("error", "");
        return "firebaseLogin";
    }

    @PostMapping("/google-signin")
    @ResponseBody
    public String handleGoogleSignIn(@RequestBody Map<String, String> request, HttpSession session) {
        String email = request.get("email");

        Client client = clientRepository.findByEmail(email);
        Admin admin = adminRepository.findByEmail(email);

        if (client != null) {
            session.setAttribute("loggedInClient", client);
            return "/dashboard";
        } else if (admin != null) {
            session.setAttribute("loggedInAdmin", admin);
            return "/admin/dashboard";
        } else {
            String generatedPassword = generateRandomPassword(10);

            Client newClient = new Client();
            newClient.setEmail(email);
            newClient.setPassword(generatedPassword);
            newClient.setName("Default Name"); 
            newClient.setContactNumber("Enter Number");

            clientRepository.save(newClient);

            session.setAttribute("loggedInClient", newClient);
            return "/dashboard";
        }
    }

    private String generateRandomPassword(int length) {
        String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(chars.charAt(random.nextInt(chars.length())));
        }
        return sb.toString();
    }

    @PostMapping("/register")
    public String register(Client client, @RequestParam String email, @RequestParam String name, @RequestParam String password, @RequestParam String confirmpassword, Model model) {
        // Check if the email is already registered
        if (clientRepository.findByEmail(client.getEmail()) != null) {
            model.addAttribute("error", "Email is already registered");
            return "redirect:/home";
        }
        if (!client.getPassword().equals(confirmpassword)) {
            model.addAttribute("error", "Passwords do not match");
            return "redirect:/";
        }
        Client newClient = new Client();
        newClient.setEmail(email);
        newClient.setPassword(password);
        newClient.setName(name);
        newClient.setContactNumber("Enter Number");
        clientRepository.save(newClient);

        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {
        Client storedClient = clientRepository.findByEmail(email);
        Admin storedAdmin = adminRepository.findByEmail(email);

        if (storedClient != null && storedClient.getPassword().equals(password)) {
            session.setAttribute("loggedInClient", storedClient); // Store client in session
            return "redirect:/dashboard"; // Redirect to the dashboard page
        } else if (storedAdmin != null && storedAdmin.getPassword().equals(password)) {
            session.setAttribute("loggedInAdmin", storedAdmin);
            return "redirect:/admin/dashboard";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "redirect:/"; // Redirect to the home page
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loggedInClient");
        session.removeAttribute("loggedInAdmin");
        return "redirect:/";
    }

}
