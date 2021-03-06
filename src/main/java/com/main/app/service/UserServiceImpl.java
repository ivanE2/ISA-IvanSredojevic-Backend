package com.main.app.service;

import com.main.app.config.SecurityUtils;
import com.main.app.domain.model.Appointment;
import com.main.app.domain.model.User;
import com.main.app.enums.Role;
import com.main.app.repository.AppointmentRepository;
import com.main.app.repository.UserRepository;
import com.main.app.service.email.RegistrationEmailService;
import com.main.app.staticData.StaticData;
import com.main.app.util.RandomStringGenerator;
import com.main.app.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * The implementation of the service used for management of the User data.
 */
@Service
public class UserServiceImpl implements UserService {

    private UserRepository userRepository;

    private CurrentUserService currentUserService;
    private RegistrationEmailService registrationEmailService;
    private AppointmentRepository appointmentRepository;

    @Value("${spring.deeplink}")
    private String deeplinkUrl;

    @Value("${spring.mail.username}")
    private String emailFrom;

    @Autowired
    public UserServiceImpl(
            UserRepository repository,
            CurrentUserService currentUserService,
            RegistrationEmailService registrationEmailService,
            AppointmentRepository appointmentRepository
    ) {
        this.userRepository = repository;
        this.currentUserService = currentUserService;
        this.registrationEmailService = registrationEmailService;
        this.appointmentRepository = appointmentRepository;
    }

    public Optional<User> getCurrentUser() {
        Optional<String> username = SecurityUtils.getCurrentUserLogin();

        return this.userRepository.findOneByEmail(username.get());
    }

    @Override
    public Optional<User> findByEmail(String email) {
        return userRepository.findOneByEmail(email);
    }


    public Optional<User> findById(Long id) {
        return userRepository.findOneById(id);
    }


    public User save(User user) {
        return userRepository.save(user);
    }

    public User editProfile(User user) {
        return userRepository.save(user);
    }

    @Override
    public User register(User user) {

        Optional<User> databaseUser = userRepository.findOneByEmail(user.getEmail());

        if (databaseUser.isPresent()) {
            return null;
        }

        user.setRegistrationToken(RandomStringGenerator.generateRandomString(50));
        user.setRole(Role.PATIENT);
        user.setPassword(UserUtil.encriptUserPassword(user.getPassword()));

        User savedUser = userRepository.save(user);

        return savedUser;
    }

    public boolean aktivate(String token) {

        Optional<User> databaseUser = userRepository.findOneByRegistrationToken(token);

        if (!databaseUser.isPresent()) {
            return false;
        }

        User user = databaseUser.get();
        user.setRegistrationConfirmed(true);
        userRepository.save(user);

        return true;
    }

    public Page<User> getUnconfirmedUsers(Pageable pageable) {
        return userRepository.findAllByAdminRegistrationConfirmed(false, pageable);
    }

    public User confirmUser(Long id) {

        Optional<User> user = userRepository.findOneById(id);

        if (!user.isPresent()) {
            return null;
        }

        User databaseUser = user.get();

        databaseUser.setAdminRegistrationConfirmed(true);
        userRepository.save(databaseUser);

        registrationEmailService.sendEmail(
                deeplinkUrl,
                "?registrationToken=" + databaseUser.getRegistrationToken(),
                emailFrom,
                databaseUser.getEmail(),
                StaticData.URL_PART_Deliverer
        );

        return databaseUser;
    }

    public User declineUser(Long id, String message) {

        Optional<User> user = userRepository.findOneById(id);

        if (!user.isPresent()) {
            return null;
        }

        User databaseUser = user.get();

        registrationEmailService.sendDeclineEmail(
                emailFrom,
                databaseUser.getEmail(),
                message
        );

        return databaseUser;
    }

    public List<User> getRateList(Pageable page) {

        User user = currentUserService.getCurrentUser().get();

        List<Appointment> appointments = appointmentRepository.findAllByPatientAndAdminAcceptedAndPatientAccepted(user,
                true, true, page);

        List<User> doctors = new ArrayList<>();

        for (Appointment a : appointments) {

            if (doctorExists(doctors, a.getDoctor())) {
                continue;
            }

            doctors.add(a.getDoctor());
        }

        return doctors;
    }

    private boolean doctorExists(List<User> users, User doctor) {

        for (User u : users) {

            if (u.getId() == doctor.getId()) {
                return true;
            }
        }

        return false;
    }

    public User rate(long doctorId, int rate) {

        User user = userRepository.findById(doctorId).get();

        user.setRateCount(user.getRateCount() + 1);
        user.setRateSum(user.getRateSum() + rate);
        user.setAverageRate(user.getRateSum() / user.getRateCount());

        userRepository.save(user);

        return user;
    }
}
