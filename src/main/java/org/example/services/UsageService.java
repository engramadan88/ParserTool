package org.example.services;

import org.example.entities.Usage;
import org.example.repositories.UsageRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class UsageService {
    private final UsageRepository usageRepository;

    public UsageService(UsageRepository usageRepository) {
        this.usageRepository = usageRepository;
    }

    public void saveUsage(double cpuUsage, double ramUsage) {
        Usage usage = new Usage();
        usage.setCpuUsage(cpuUsage);
        usage.setRamUsage(ramUsage);
        usage.setTimestamp(LocalDateTime.now());
        usageRepository.save(usage);
    }
}