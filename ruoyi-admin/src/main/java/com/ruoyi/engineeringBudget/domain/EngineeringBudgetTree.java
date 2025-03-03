package com.ruoyi.engineeringBudget.domain;


import com.ruoyi.common.core.domain.TreeEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public class EngineeringBudgetTree  extends TreeEntity {
    /** 节点ID */
    private Integer budgetId;
    /** 层级 */
    private Integer level;

    private String projectName;

    public Integer getBudgetId() {
        return budgetId;
    }

    public void setBudgetId(Integer budgetId) {
        this.budgetId = budgetId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }




    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("budgetId", getBudgetId())
                .append("parentId", getParentId())
                .append("level", getLevel())
                .append("projectName", getProjectName())
                .toString();
     }
}
