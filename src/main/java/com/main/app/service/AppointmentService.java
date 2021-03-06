package com.main.app.service;

import com.main.app.domain.model.Appointment;
import com.main.app.domain.model.Clinic;
import com.main.app.domain.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface AppointmentService {


    List<Appointment> findAllByClinic(Clinic clinic, Pageable pageable);

    List<Appointment> findAllByPatient(User patient, Pageable pageable);

    List<Appointment> findAllByPatientHistory(User patient, Pageable pageable);

    Page<Appointment> findAllByAdminAccepted(boolean adminAccepted, Pageable pageable);

    Appointment save(Appointment appointment);

    Appointment createFromTermin(long terminId);

    Appointment approveAppointment(long appointmentId, long terminId, long hallId);

    Appointment changePatientStatus(long appointmentId, boolean status);

}
