package com.main.app.service;

import com.main.app.domain.model.Surgery;
import com.main.app.domain.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface SurgeryService {

    Page<Surgery> findAllByPatient(User patient, Pageable pageable);

    Surgery save(Surgery surgery);
}
