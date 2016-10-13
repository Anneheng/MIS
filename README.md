###设备巡检
1.根据当前时间预警所有该检修的设备
select date.EID,date.BDate,category.period,category.TQQ FROM date,category,equipment 
WHERE date.EID=equipment.EID AND equipment.CID=category.CID;
![](a1.png)
2.根据设备编号，查询出设备检修报告（包括历史检修情况和材料消耗情况）
select baoyang.BID,baoyang.EID,xm.xmName,QK,Material,Num,baoyang.Woker 
FROM baoyang,expend,xm,equipment 
WHERE baoyang.EID=1 and baoyang.EID=expend.EID AND baoyang.BID=expend.BID and equipment.CID=xm.CID;
![](a2.png)
