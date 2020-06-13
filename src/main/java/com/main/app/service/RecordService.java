package com.main.app.service;

import com.main.app.domain.model.Record;
import com.main.app.domain.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface RecordService {

    Page<Record> findAllByPatient(User patient, Pageable pageable);

    Record save(Record record);
}
