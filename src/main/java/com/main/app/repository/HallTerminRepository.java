package com.main.app.repository;

import com.main.app.domain.model.HallTermin;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HallTerminRepository extends JpaRepository<HallTermin, Long> {

    List<HallTermin> findAll();

    List<HallTermin> findAllByFree(boolean free);
}
