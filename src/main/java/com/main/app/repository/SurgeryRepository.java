package com.main.app.repository;

import com.main.app.domain.model.Surgery;
import com.main.app.domain.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SurgeryRepository extends JpaRepository<Surgery, Long> {

    Page<Surgery> findAllByPatient(User patient, Pageable pageable);
}
