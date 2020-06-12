package com.main.app.repository;

import com.main.app.domain.model.AppointmentType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AppointmentTypeRepository extends JpaRepository<AppointmentType, Long> {

    List<AppointmentType> findAll();
}
