package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Subscription;

public interface SubscriptionRepository extends JpaRepository<Subscription, Long> {

    Optional<Subscription> findByClientEmailAndCertificationName(String clientEmail, String certificationName);

    List<Subscription> findByClientEmail(String clientEmail);

    List<Subscription> findByCertificationName(String certificationName);

    List<Subscription> findByAdminEmailsAndVerified(String email, String string);

    List<Subscription> findByclientEmailAndVerified(String email, String string);


}

