package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import com.example.demo.entity.AdminCertifications;

@Repository
public interface AdminCertificationRepository extends JpaRepository<AdminCertifications, Long> {
    List<AdminCertifications> findByEmail(String email);
    List<AdminCertifications> findByCertificationName(String certificationName);

}
