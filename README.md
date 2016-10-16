##设备巡检
###1.根据当前时间预警所有该检修的设备
select date.EID FROM date,category,equipment 
WHERE date.EID=equipment.EID AND equipment.CID=category.CID and datediff(date.BDate,now())<category.period;
####![image](https://github.com/Anneheng/MIS/blob/master/a1.PNG)
###2.根据设备编号，查询出设备检修报告（包括历史检修情况和材料消耗情况）
select baoyang.BID,baoyang.EID,xm.xmName,QK,Material,Num,baoyang.Woker 
FROM baoyang,expend,xm,equipment 
WHERE baoyang.EID=1 and baoyang.EID=expend.EID AND baoyang.BID=expend.BID and equipment.CID=xm.CID;
####![image](https://github.com/Anneheng/MIS/blob/master/a2.PNG)
##ER图
####![image](https://github.com/Anneheng/MIS/blob/master/ER图.PNG)
##原型截图
###根据调用数据库，最后检查时间、t设备周期、提前期，自动预警该检修的设备。
####![image](https://github.com/Anneheng/MIS/blob/master/1.PNG)
###根据输入的设备号，显示设备的相关信息，要检查的项目。
####![image](https://github.com/Anneheng/MIS/blob/master/2.PNG)
####![image](https://github.com/Anneheng/MIS/blob/master/3.PNG)
####![image](https://github.com/Anneheng/MIS/blob/master/4.PNG)
