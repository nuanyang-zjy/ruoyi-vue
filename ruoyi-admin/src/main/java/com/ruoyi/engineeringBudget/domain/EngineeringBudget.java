package com.ruoyi.engineeringBudget.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.TreeEntity;
import org.springframework.stereotype.Component;

/**
 * 工程概算对象 engineering_budget
 * 
 * @author ruoyi
 * @date 2024-09-28
 */
@Component
public class EngineeringBudget extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 节点ID */
    private Integer budgetId;

    /** 层级 */
    private Integer level;

    /** 工程名字 */
    @Excel(name = "工程名字")
    private String projectName;

    /** 井巷工程费 */
    @Excel(name = "井巷工程费")
    private BigDecimal tunnelCost;

    /** 建筑工程费 */
    @Excel(name = "建筑工程费")
    private BigDecimal buildingCost;

    /** 安装工程费 */
    @Excel(name = "安装工程费")
    private BigDecimal installationCost;

    /** 设备购置费 */
    @Excel(name = "设备购置费")
    private BigDecimal equipmentCost;

    /** 其他费用 */
    @Excel(name = "其他费用")
    private BigDecimal otherCost;

    /** 合计 */
    @Excel(name = "合计")
    private BigDecimal totalCost;

    /** 工程状态 */
    @Excel(name = "工程状态")
    private char projectStatus;

    /** 描述信息 */
    @Excel(name = "描述信息")
    private String description;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updatedTime;


    public void setBudgetId(Integer budgetId)
    {
        this.budgetId = budgetId;
    }

    public Integer getBudgetId()
    {
        return budgetId;
    }
    public void setLevel(Integer level)
    {
        this.level = level;
    }

    public Integer getLevel()
    {
        return level;
    }
    public void setProjectName(String projectName) 
    {
        this.projectName = projectName;
    }

    public String getProjectName() 
    {
        return projectName;
    }
    public void setTunnelCost(BigDecimal tunnelCost) 
    {
        this.tunnelCost = tunnelCost;
    }

    public BigDecimal getTunnelCost() 
    {
        return tunnelCost;
    }
    public void setBuildingCost(BigDecimal buildingCost) 
    {
        this.buildingCost = buildingCost;
    }

    public BigDecimal getBuildingCost() 
    {
        return buildingCost;
    }
    public void setInstallationCost(BigDecimal installationCost) 
    {
        this.installationCost = installationCost;
    }

    public BigDecimal getInstallationCost() 
    {
        return installationCost;
    }
    public void setEquipmentCost(BigDecimal equipmentCost) 
    {
        this.equipmentCost = equipmentCost;
    }

    public BigDecimal getEquipmentCost() 
    {
        return equipmentCost;
    }
    public void setOtherCost(BigDecimal otherCost) 
    {
        this.otherCost = otherCost;
    }

    public BigDecimal getOtherCost() 
    {
        return otherCost;
    }
    public void setTotalCost(BigDecimal totalCost) 
    {
        this.totalCost = totalCost;
    }

    public BigDecimal getTotalCost() 
    {
        return totalCost;
    }
    public void setProjectStatus(char projectStatus)
    {
        this.projectStatus = projectStatus;
    }

    public char getProjectStatus()
    {
        return projectStatus;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setCreatedTime(Date createdTime) 
    {
        this.createdTime = createdTime;
    }

    public Date getCreatedTime() 
    {
        return createdTime;
    }
    public void setUpdatedTime(Date updatedTime) 
    {
        this.updatedTime = updatedTime;
    }

    public Date getUpdatedTime() 
    {
        return updatedTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("budgetId", getBudgetId())
            .append("parentId", getParentId())
            .append("level", getLevel())
            .append("projectName", getProjectName())
            .append("tunnelCost", getTunnelCost())
            .append("buildingCost", getBuildingCost())
            .append("installationCost", getInstallationCost())
            .append("equipmentCost", getEquipmentCost())
            .append("otherCost", getOtherCost())
            .append("totalCost", getTotalCost())
            .append("projectStatus", getProjectStatus())
            .append("description", getDescription())
            .append("createdTime", getCreatedTime())
            .append("updatedTime", getUpdatedTime())
            .toString();
    }
}
