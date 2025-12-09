//健康宣教组件

import { HealthCard, type HealthData } from './HealthCard'

@Component
export default struct Health {
  @State healthDataList: HealthData[] = [
    {
      icon: $r('sys.symbol.heart_fill'),
      label: '心率',
      value: '72',
      unit: 'bpm',
      status: 'normal'
    },
    {
      icon: $r('sys.symbol.leaf_fill'),
      label: '血氧',
      value: '98',
      unit: '%',
      status: 'normal'
    },
    {
      icon: $r('sys.symbol.thermometer_fill'),
      label: '体温',
      value: '36.5',
      unit: '°C',
      status: 'normal'
    },
    {
      icon: $r('sys.symbol.drop_fill'),
      label: '血压',
      value: '120/80',
      unit: 'mmHg',
      status: 'normal'
    },
    {
      icon: $r('sys.symbol.checkmark_circle_fill'),
      label: '血糖',
      value: '5.2',
      unit: 'mmol/L',
      status: 'normal'
    },
    {
      icon: $r('sys.symbol.clock_fill'),
      label: '睡眠',
      value: '7.5',
      unit: '小时',
      status: 'normal'
    },
    {
      icon: $r('sys.symbol.moon_fill'),
      label: '压力',
      value: '32',
      unit: '%',
      status: 'warning'
    }
  ]

  build() {
    Scroll() {
      Column() {
        Text('健康宣教')
          .width('100%')
          .margin({
            top: '48vp',
            bottom: '24vp'
          })
          .fontWeight(700)
          .fontSize('26fp')

        // 健康卡片网格
        Grid() {
          GridItem() {
            HealthCard({ data: this.healthDataList[0] })
          }
          .columnStart(0)
          .columnEnd(1)

          ForEach(this.healthDataList.slice(1), (item: HealthData) => {
            GridItem() {
              HealthCard({ data: item })
            }
          }, (item: HealthData) => JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap('12vp')
        .rowsGap('12vp')
        .width('100%')
        .height('auto')
        .padding('0vp')

        Blank()
      }
      .width('100%')
      .padding({
        left: '12vp',
        right: '12vp',
        bottom: '12vp'
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
