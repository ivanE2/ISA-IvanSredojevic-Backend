package com.main.app.domain.model;

import com.main.app.domain.dto.AppointmentDTO;
import com.main.app.domain.dto.ClinicDTO;
import com.main.app.domain.dto.HallDTO;
import com.main.app.domain.dto.UserDTO;
import com.main.app.domain.model.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.Instant;

@Entity
@Getter
@Setter
public class Appointment extends AbstractEntity {

    private Instant date;
    private double price;
    private boolean isTaken;
    private String description;

    private boolean adminAccepted;
    private boolean patientAccepted;

    @ManyToOne
    private DoctorTermin termin;

    @ManyToOne
    private HallTermin hallTermin;

    @ManyToOne
    private Hall hall;

    @ManyToOne
    private User doctor;

    @ManyToOne
    private User patient;

    @ManyToOne
    private Clinic clinic;

    @ManyToOne
    private AppointmentType type;

    public Appointment() {

    }

    public Appointment(Instant date, AppointmentType type, double price, boolean isTaken, Hall hall, User doctor, User patient, String description, Clinic clinic) {

        this.date = date;
        this.type = type;
        this.price = price;
        this.isTaken = isTaken;
        this.hall = hall;
        this.doctor = doctor;
        this.patient = patient;
        this.description = description;
        this.clinic = clinic;
    }

    public Appointment(AppointmentDTO appointment) {
        this.id = appointment.getId();
        this.date = appointment.getDate();
        this.type = new AppointmentType(appointment.getType());
        this.price = appointment.getPrice();
        this.isTaken = appointment.isTaken();
        this.description = appointment.getDescription();
        this.hall = new Hall(appointment.getHall());
        this.doctor = new User(appointment.getDoctor());
        this.patient = new User(appointment.getPatient());
        this.clinic = new Clinic(appointment.getClinic());
        this.termin = new DoctorTermin(appointment.getTermin());
    }
}
