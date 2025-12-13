import { Options } from '@mcui/mccharts';
import {HealthData} from './HealthNumData';

// 获取折线图配置
export function getLineChartOptions(data: HealthData): Options {
  return new Options({
    grid:{
      left:5,
      right:5,
      top:5,
      bottom:5,
    },
    title: {
      show: false
    },
    xAxis: {
      data: data.history?.map((_, i) => String(i)) || [],
      axisTick: { 
      show: false, 
      },
      axisLine: { 
      show: false,
      },
      splitLine: { // 坐标轴中的分隔线。
        show: false,
      },
      axisLabel:{
        fontSize:0,
      },
      boundaryGap: false,
    },
    yAxis:{
      axisTick: { 
        show: false, 
      },
      axisLine: { 
        show: false,
      },
      splitLine: { // 坐标轴中的分隔线。
        show: false
      },
      axisLabel:{
        fontSize:0,
      },
      min: 60,
      max: 100,
      boundaryGap: false,
    },
    series: [{
      name: data.label,
      data: data.history || [],
      smooth: true,
      lineStyle:{
        color:'#ff0000'
      },
      areaStyle:{
        show: true,
        gradient:['rgba(255, 0, 0,0.6)','#ffffff']
      },
    }],
    legend:{
      show:false,
    }
  });
}

// 获取柱状图配置
export function getBarChartOptions(data: HealthData): Options {
  return new Options({
    grid:{
      left:5,
      right:5,
      top:5,
      bottom:5,
    },
    title: {
      show: false
    },
    xAxis: {
      data: data.history?.slice(-4).map((_, i) => String(i)) || [],
      axisTick: { 
      show: false, 
      },
      axisLine: { 
      show: false,
      },
      splitLine: { // 坐标轴中的分隔线。
        show: false,
      },
      axisLabel:{
        fontSize:0,
      },
      boundaryGap: false,
    },
    yAxis: {
      axisTick: { 
        show: false, 
      },
      axisLine: { 
        show: false,
      },
      splitLine: { // 坐标轴中的分隔线。
        show: false
      },
      axisLabel:{
        fontSize:0,
      },
      boundaryGap: false,
    },
    series: [{
      name: data.label,
      data: data.history?.slice(-4) || [],
      barStyle:{
        width: 5,
        color: data.label === '压力' ? '#5FECCA' : '#3DC875',
      },
    }],
    dataZoom:{
      show: true,
    },
    legend:{
      show:false,
    }
  });
}

// 获取饼图配置
export function getPieChartOptions(data: HealthData): Options {
  return new Options({
    series: [{
      radius: ['80%', '50%'], // 饼图外半径、内半径
      center: ['50%', '50%'], // 饼图中心位置
      data: data.sleepData,
    }],
    title: {
      show: false,
    },
    legend: {
      show: false,
    },
    grid:{
      left:5,
      right:5,
      top:5,
      bottom:5,
    },
    color:['#1BC0F2','#5BD793']
  });
}