package org.example.utils;

import org.example.services.UsageService;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.SigarException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class UsageCollector {
    private final UsageService usageService;
    private final Sigar sigar;

    public UsageCollector(UsageService usageService) {
        this.usageService = usageService;
        this.sigar = new Sigar();
    }

    @Scheduled(fixedDelay = 300000) // run every 5 minutes
    public void collectUsageData() throws SigarException {
        // use Sigar to collect CPU and RAM usage data
        double cpuUsage = sigar.getCpuPerc().getCombined();
        double ramUsage = sigar.getMem().getUsedPercent();
        usageService.saveUsage(cpuUsage, ramUsage);
    }
}