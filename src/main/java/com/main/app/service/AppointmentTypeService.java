package com.main.app.service;

import com.main.app.domain.model.AppointmentType;

import java.util.List;

public interface AppointmentTypeService {

    List<AppointmentType> findAll();
}
