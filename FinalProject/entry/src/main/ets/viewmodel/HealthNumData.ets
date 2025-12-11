export interface SleepItem {
  value: number; // 数值，例如 2.5 小时
  name: string; // 名称，例如 "深度睡眠"
}

export interface HealthData {
  icon: Resource; // 图标
  label: string; // 标签（如：心率、血氧等）
  value: string; // 数值
  unit: string; // 单位
  type?: "line" | "bar" | "pie" | "simple"; //可选：图表类型
  history?: number[]; // 可选：历史数据（用于图表）
  sleepData?: SleepItem[]; // 可选：睡眠数据;
}

export const heartRateData: HealthData = {
  icon: $r('sys.symbol.heart_fill'),
  label: '心率',
  value: '72',
  unit: 'bpm',
  type: 'line',
  history: [88,63,93,78]
};

export const healthDataList: HealthData[] = [
  {
    icon: $r('sys.symbol.leaf_fill'),
    label: '血氧饱和度',
    value: '98',
    unit: '%',
    type: 'bar',
    history: [96, 97, 91, 94, 97]
  },
  {
    icon: $r('sys.symbol.thermometer_fill'),
    label: '体温',
    value: '36.5',
    unit: '°C',
  },
  {
    icon: $r('sys.symbol.drop_fill'),
    label: '血压',
    value: '120/80',
    unit: 'mmHg',
  },
  {
    icon: $r('sys.symbol.checkmark_circle_fill'),
    label: '血糖',
    value: '5.2',
    unit: 'mmol/L',
    history: [5.0, 5.1, 5.2, 5.3, 5.2]
  },
  {
    icon: $r('sys.symbol.clock_fill'),
    label: '睡眠',
    value: '7.5',
    sleepData:[{value:2.5, name:'深度'},{value:5, name:'浅度'}],
    unit: '小时',
    type: 'pie',
  },
  {
    icon: $r('sys.symbol.moon_fill'),
    label: '压力',
    value: '32',
    unit: '%',
    type: 'bar',
    history: [30, 32, 28, 25, 32]
  }
];