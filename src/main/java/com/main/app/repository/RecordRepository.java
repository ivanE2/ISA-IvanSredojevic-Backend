package com.main.app.repository;

import com.main.app.domain.model.Record;
import com.main.app.domain.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RecordRepository extends JpaRepository<Record, Long> {

    Page<Record> findAllByPatient(User patient, Pageable pageable);
}
