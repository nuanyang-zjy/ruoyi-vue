package com.ruoyi.engineeringBudget.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.engineeringBudget.domain.EngineeringBudgetTree;
import com.ruoyi.engineeringBudget.domain.SelectParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.engineeringBudget.domain.EngineeringBudget;
import com.ruoyi.engineeringBudget.service.IEngineeringBudgetService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 工程概算Controller
 * 
 * @author ruoyi
 * @date 2024-09-28
 */

@RestController
@RequestMapping("/engineeringBudget/engineeringBudget")
public class EngineeringBudgetController extends BaseController
{
    @Autowired
    private IEngineeringBudgetService engineeringBudgetService;

    /**
     * 查询工程概算列表
     */
    @PreAuthorize("@ss.hasPermi('engineeringBudget:engineeringBudget:list')")
    @GetMapping("/list")
    public AjaxResult list()
    {
        List<EngineeringBudget> list = engineeringBudgetService.selectAll();
        return success(list);
    }

    /**
     * 多条件查询
     */
    @PreAuthorize("@ss.hasPermi('engineeringBudget:engineeringBudget:query')")
    @GetMapping("/select")
    public AjaxResult select( SelectParam selectParam)
    {
        System.out.println(selectParam.getProjectStatus());
        List<EngineeringBudget> list = engineeringBudgetService.selectEngineeringBudgetList(selectParam);
        return success(list);
    }



    /**
     * 查询工程概树
     */

    @PreAuthorize("@ss.hasPermi('engineeringBudget:engineeringBudget:list')")
    @GetMapping("/tree")
    public AjaxResult tree()
    {
        List<EngineeringBudgetTree> list = engineeringBudgetService.selectEngineeringBudgetTree();
        return success(list);
    }



    /**
     * 导出工程概算列表
     */
    @PreAuthorize("@ss.hasPermi('engineeringBudget:engineeringBudget:export')")
    @Log(title = "工程概算", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EngineeringBudget engineeringBudget)
    {
        List<EngineeringBudget> list = engineeringBudgetService.selectAll();
        ExcelUtil<EngineeringBudget> util = new ExcelUtil<EngineeringBudget>(EngineeringBudget.class);
        util.exportExcel(response, list, "工程概算数据");
    }

    /**
     * 获取工程概算详细信息
     */
    @PreAuthorize("@ss.hasPermi('engineeringBudget:engineeringBudget:query')")
    @GetMapping(value = "/{budgetId}")
    public AjaxResult getInfo(@PathVariable("budgetId") Integer budgetId)
    {
        return success(engineeringBudgetService.selectEngineeringBudgetByBudgetId(budgetId));
    }

    /**
     * 新增工程概算
     */
    @PreAuthorize("@ss.hasPermi('engineeringBudget:engineeringBudget:add')")
    @Log(title = "工程概算", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EngineeringBudget engineeringBudget)
    {

        return toAjax(engineeringBudgetService.insertEngineeringBudget(engineeringBudget));
    }

    /**
     * 修改工程概算
     */
    @PreAuthorize("@ss.hasPermi('engineeringBudget:engineeringBudget:edit')")
    @Log(title = "工程概算", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EngineeringBudget engineeringBudget)
    {
        return toAjax(engineeringBudgetService.updateEngineeringBudget(engineeringBudget));
    }

    /**
     * 删除工程概算
     */
    @PreAuthorize("@ss.hasPermi('engineeringBudget:engineeringBudget:remove')")
    @Log(title = "工程概算", businessType = BusinessType.DELETE)
	@DeleteMapping("/{budgetIds}")
    public AjaxResult remove(@PathVariable Long[] budgetIds)
    {
        return toAjax(engineeringBudgetService.deleteEngineeringBudgetByBudgetIds(budgetIds));
    }
}
