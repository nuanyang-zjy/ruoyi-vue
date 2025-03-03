package com.ruoyi.engineeringBudget.domain;

import com.ruoyi.common.core.domain.TreeEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.poi.hpsf.Decimal;

import java.math.BigDecimal;

public class SelectParam {
    private String projectName;
    private BigDecimal beginTunnelCost;
    private BigDecimal endTunnelCost;
    private BigDecimal beginBuildingCost;
    private BigDecimal endBuildingCost;
    private BigDecimal beginInstallationCost;
    private BigDecimal endInstallationCost;
    private BigDecimal beginEquipmentCost;
    private BigDecimal endEquipmentCost;
    private BigDecimal beginOtherCost;
    private BigDecimal endOtherCost;
    private BigDecimal beginTotalCost;
    private BigDecimal endTotalCost;
    private String projectStatus;
    public SelectParam(){}

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public BigDecimal getBeginTunnelCost() {
        return beginTunnelCost;
    }

    public void setBeginTunnelCost(BigDecimal beginTunnelCost) {
        this.beginTunnelCost = beginTunnelCost;
    }

    public BigDecimal getEndTunnelCost() {
        return endTunnelCost;
    }

    public void setEndTunnelCost(BigDecimal endTunnelCost) {
        this.endTunnelCost = endTunnelCost;
    }

    public BigDecimal getBeginBuildingCost() {
        return beginBuildingCost;
    }

    public void setBeginBuildingCost(BigDecimal beginBuildingCost) {
        this.beginBuildingCost = beginBuildingCost;
    }

    public BigDecimal getEndBuildingCost() {
        return endBuildingCost;
    }

    public void setEndBuildingCost(BigDecimal endBuildingCost) {
        this.endBuildingCost = endBuildingCost;
    }

    public BigDecimal getBeginInstallationCost() {
        return beginInstallationCost;
    }

    public void setBeginInstallationCost(BigDecimal beginInstallationCost) {
        this.beginInstallationCost = beginInstallationCost;
    }

    public BigDecimal getEndInstallationCost() {
        return endInstallationCost;
    }

    public void setEndInstallationCost(BigDecimal endInstallationCost) {
        this.endInstallationCost = endInstallationCost;
    }

    public BigDecimal getBeginEquipmentCost() {
        return beginEquipmentCost;
    }

    public void setBeginEquipmentCost(BigDecimal beginEquipmentCost) {
        this.beginEquipmentCost = beginEquipmentCost;
    }

    public BigDecimal getEndEquipmentCost() {
        return endEquipmentCost;
    }

    public void setEndEquipmentCost(BigDecimal endEquipmentCost) {
        this.endEquipmentCost = endEquipmentCost;
    }

    public BigDecimal getBeginOtherCost() {
        return beginOtherCost;
    }

    public void setBeginOtherCost(BigDecimal beginOtherCost) {
        this.beginOtherCost = beginOtherCost;
    }

    public BigDecimal getEndOtherCost() {
        return endOtherCost;
    }

    public void setEndOtherCost(BigDecimal endOtherCost) {
        this.endOtherCost = endOtherCost;
    }

    public BigDecimal getBeginTotalCost() {
        return beginTotalCost;
    }

    public void setBeginTotalCost(BigDecimal beginTotalCost) {
        this.beginTotalCost = beginTotalCost;
    }

    public BigDecimal getEndTotalCost() {
        return endTotalCost;
    }

    public void setEndTotalCost(BigDecimal endTotalCost) {
        this.endTotalCost = endTotalCost;
    }

    public String getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("projectName",getProjectName())
                .append("beginTunnelCost",getBeginTunnelCost())
                .append("endTunnelCost",getEndTotalCost())
                .append("beginBuildingCost",getBeginBuildingCost())
                .append("endBuildingCost",getEndBuildingCost())
                .append("beginInstallationCost",getBeginInstallationCost())
                .append("endInstallationCost",getEndInstallationCost())
                .append("beginEquipmentCost",getBeginEquipmentCost())
                .append("endEquipmentCost",getEndEquipmentCost())
                .append("beginOtherCost",getBeginOtherCost())
                .append("endOtherCost",getEndOtherCost())
                .append("beginTotalCost",getBeginTotalCost())
                .append("endTotalCost",getEndTotalCost())
                .append("projectStatus",getProjectStatus())
                .toString();
    }
}
