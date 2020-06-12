package com.main.app.repository;

import com.main.app.domain.model.Clinic;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClinicRepository extends JpaRepository<Clinic, Long> {

    Page<Clinic> findAll(Pageable pageable);
}
