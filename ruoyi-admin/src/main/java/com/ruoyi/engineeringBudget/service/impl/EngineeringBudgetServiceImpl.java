package com.ruoyi.engineeringBudget.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.ruoyi.engineeringBudget.domain.EngineeringBudgetTree;
import com.ruoyi.engineeringBudget.domain.SelectParam;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.engineeringBudget.mapper.EngineeringBudgetMapper;
import com.ruoyi.engineeringBudget.domain.EngineeringBudget;
import com.ruoyi.engineeringBudget.service.IEngineeringBudgetService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 工程概算Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-28
 */
@Service
public class EngineeringBudgetServiceImpl implements IEngineeringBudgetService 
{
    @Autowired
    private EngineeringBudgetMapper engineeringBudgetMapper;
    @Autowired
    private EngineeringBudget engineering_Budget;

    /**
     * 查询工程概算
     * 
     * @param budgetId 工程概算主键
     * @return 工程概算
     */
    @Override
    public EngineeringBudget selectEngineeringBudgetByBudgetId(Integer budgetId)
    {
        return engineeringBudgetMapper.selectEngineeringBudgetByBudgetId(budgetId);
    }

    /**
     * 查询工程概算列表
     * 
     * @param selectParam 工程概算
     * @return 工程概算
     */
    @Override
    public List<EngineeringBudget> selectEngineeringBudgetList(SelectParam selectParam)
    {

        return engineeringBudgetMapper.selectEngineeringBudgetList(selectParam);
    }
    @Override
    public List<EngineeringBudget> selectAll(){
        return engineeringBudgetMapper.selectAll();
    }

    @Override
    public  List<EngineeringBudgetTree> selectEngineeringBudgetTree(){

        return engineeringBudgetMapper.selectEngineeringBudgetTree();
    }



    /**
     * 新增工程概算
     * 
     * @param engineeringBudget 工程概算
     * @return 结果
     */
    @Transactional
    @Override
    public int insertEngineeringBudget(EngineeringBudget engineeringBudget) {
            sync(engineeringBudget);
            return engineeringBudgetMapper.insertEngineeringBudget(engineeringBudget);
    }

    /**
     * 修改工程概算
     * 
     * @param engineeringBudget 工程概算
     * @return 结果
     */
    @Transactional
    @Override
    public int updateEngineeringBudget(EngineeringBudget engineeringBudget)
    {
            int x = engineeringBudgetMapper.updateEngineeringBudget(engineeringBudget);
            sync(engineeringBudget);
            return x;
    }

    /**
     * 批量删除工程概算
     * 
     * @param budgetIds 需要删除的工程概算主键
     * @return 结果
     */
    @Override
    public int deleteEngineeringBudgetByBudgetIds(Long[] budgetIds)
    {
        return engineeringBudgetMapper.deleteEngineeringBudgetByBudgetIds(budgetIds);
    }

    /**
     * 删除工程概算信息
     * 
     * @param budgetId 工程概算主键
     * @return 结果
     */
    @Override
    public int deleteEngineeringBudgetByBudgetId(Long budgetId)
    {
        return engineeringBudgetMapper.deleteEngineeringBudgetByBudgetId(budgetId);
    }

    private void sync(EngineeringBudget engineeringBudget){
        engineering_Budget=engineeringBudgetMapper.selectEngineeringBudgetByBudgetId(engineeringBudget.getBudgetId());
        BigDecimal build= engineeringBudget.getBuildingCost().subtract(engineering_Budget.getBuildingCost());
        BigDecimal tunnel= engineeringBudget.getTunnelCost().subtract(engineering_Budget.getTunnelCost());
        BigDecimal install =engineeringBudget.getInstallationCost().subtract(engineering_Budget.getInstallationCost());
        BigDecimal equipment= engineeringBudget.getEquipmentCost().subtract(engineering_Budget.getEquipmentCost());
        BigDecimal other = engineeringBudget.getOtherCost().subtract(engineering_Budget.getOtherCost());
        BigDecimal total = engineeringBudget.getTotalCost().subtract(engineering_Budget.getTotalCost());
        engineeringBudget.setBuildingCost(build);
        engineeringBudget.setEquipmentCost(equipment);
        engineeringBudget.setTunnelCost(tunnel);
        engineeringBudget.setInstallationCost(install);
        engineeringBudget.setOtherCost(other);
        engineeringBudget.setTotalCost(total);
        if (engineeringBudget.getParentId() != null) {
            BeanUtils.copyProperties(engineeringBudget, engineering_Budget);
            while (engineering_Budget.getParentId() != null) {
                engineering_Budget.setBudgetId(engineering_Budget.getParentId());
                engineering_Budget.setParentId(engineeringBudgetMapper.selectEngineeringBudgetByBudgetId(engineering_Budget.getBudgetId()).getParentId());
                int i = engineeringBudgetMapper.updateSync(engineering_Budget);
            }
        }
    }
}
