# W1：[模拟信号](https://github.com/OS-Q/W1)

[![sites](OS-Q/OS-Q.png)](http://www.OS-Q.com)

#### 归属信号采集：[M1](https://github.com/OS-Q/M1)

#### 关于系统架构：[OS-Q](https://github.com/OS-Q/OS-Q)

## [平台描述](https://github.com/OS-Q/W1/wiki) 

模拟信号采集平台用于采集模拟信号，主要是电压信号或其他信号和电压信号的转换采集

### [共用资源](https://github.com/OS-Q/W1/wiki) 

---

- 边缘设备命名规则：体系 Q:[1,4] -> 节点 M:[1,12] -> 平台 W:[1,52] -> 设备 D:[1,365]

- naming patterns：system Q[1,4] -> node M[1,12] -> platform W[1,52] -> device D[1,365]

## [包含设备](https://github.com/OS-Q/W1/wiki) 

#### D1：[低成本设备](https://github.com/OS-Q/D1)

低成本板载多通道12bit ADC信号转换

#### D2：[低功耗设备](https://github.com/OS-Q/D2)

低功耗低成本多通道集成12bit ADC转换

#### D3：[高精度设备](https://github.com/OS-Q/D3)

高精度ADC采样芯片转换模拟数据

#### D4：[多通道设备](https://github.com/OS-Q/D4)

大于8通道可以同时采集转换

#### D5：[宽范围设备](https://github.com/OS-Q/D5)

具有较大的信号采集区间

#### D6：[低时延设备](https://github.com/OS-Q/D6)

快速高频次转换模拟信号

#### D7：[高可靠设备](https://github.com/OS-Q/D7)

长时间稳定可靠工作性能

## [同级平台](https://github.com/OS-Q/M1/wiki)

#### -> W1：[模拟信号](https://github.com/OS-Q/W1)

用于模拟信号的采集转换

#### W2：[数字信号](https://github.com/OS-Q/W2)

用于数字信号驱动和采集

#### W3：[阈值监控](https://github.com/OS-Q/W3)

用于实时监控阈值被触发

#### W4：[特殊平台](https://github.com/OS-Q/W4)

用于处理特殊信号的采集

---

####  © qitas@qitas.cn
###  [OS-Q redefined Operation System](http://www.OS-Q.com)
####  @ 2019-1-3
