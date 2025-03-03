package com.ruoyi.engineeringBudget.service;

import java.util.List;
import com.ruoyi.engineeringBudget.domain.EngineeringBudget;
import com.ruoyi.engineeringBudget.domain.EngineeringBudgetTree;
import com.ruoyi.engineeringBudget.domain.SelectParam;

/**
 * 工程概算Service接口
 * 
 * @author ruoyi
 * @date 2024-09-28
 */
public interface IEngineeringBudgetService 
{
    /**
     * 查询工程概算
     * 
     * @param budgetId 工程概算主键
     * @return 工程概算
     */
    public EngineeringBudget selectEngineeringBudgetByBudgetId(Integer budgetId);

    /**
     * 查询工程概算列表
     * 
     * @param selectParam 工程概算
     * @return 工程概算集合
     */
    public List<EngineeringBudget> selectEngineeringBudgetList(SelectParam selectParam);

    public List<EngineeringBudget> selectAll();
    /**
     * 新增工程概算
     * 
     * @param engineeringBudget 工程概算
     * @return 结果
     */
    public int insertEngineeringBudget(EngineeringBudget engineeringBudget);
    /**
     * 工程概算树
     *
     * @return 结果
     */
    public  List<EngineeringBudgetTree> selectEngineeringBudgetTree();
    /**
     * 修改工程概算
     * 
     * @param engineeringBudget 工程概算
     * @return 结果
     */
    public int updateEngineeringBudget(EngineeringBudget engineeringBudget);

    /**
     * 批量删除工程概算
     * 
     * @param budgetIds 需要删除的工程概算主键集合
     * @return 结果
     */
    public int deleteEngineeringBudgetByBudgetIds(Long[] budgetIds);

    /**
     * 删除工程概算信息
     * 
     * @param budgetId 工程概算主键
     * @return 结果
     */
    public int deleteEngineeringBudgetByBudgetId(Long budgetId);
}
