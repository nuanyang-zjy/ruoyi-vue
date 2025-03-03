package com.ruoyi.engineeringBudget.mapper;

import java.util.List;
import com.ruoyi.engineeringBudget.domain.EngineeringBudget;
import com.ruoyi.engineeringBudget.domain.EngineeringBudgetTree;
import com.ruoyi.engineeringBudget.domain.SelectParam;
import org.apache.ibatis.annotations.Mapper;

/**
 * 工程概算Mapper接口
 * 
 * @author ruoyi
 * @date 2024-09-28
 */
@Mapper
public interface EngineeringBudgetMapper 
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
     * @param  selectParam 工程概算
     * @return 工程概算集合
     */
    public List<EngineeringBudget> selectEngineeringBudgetList(SelectParam selectParam);

    public List<EngineeringBudget> selectAll();

    public List<EngineeringBudgetTree> selectEngineeringBudgetTree();
    /**
     * 新增工程概算
     * 
     * @param engineeringBudget 工程概算
     * @return 结果
     */
    public int insertEngineeringBudget(EngineeringBudget engineeringBudget);

    /**
     * 修改工程概算
     * 
     * @param engineeringBudget 工程概算
     * @return 结果
     */
    public int updateEngineeringBudget(EngineeringBudget engineeringBudget);

    public int updateSync(EngineeringBudget engineeringBudget);
    /**
     * 删除工程概算
     * 
     * @param budgetId 工程概算主键
     * @return 结果
     */
    public int deleteEngineeringBudgetByBudgetId(Long budgetId);

    /**
     * 批量删除工程概算
     * 
     * @param budgetIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEngineeringBudgetByBudgetIds(Long[] budgetIds);
}
