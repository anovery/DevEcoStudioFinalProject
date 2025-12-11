//健康宣教组件
import { healthDataList, heartRateData, type HealthData } from '../viewmodel/HealthNumData';
import { HealthCard} from './HealthCard'

@Component
export default struct Health {

  private __hrTimer: number = 0;

  build() {
    Scroll() {
      Column() {
        Text('用户健康')
          .width('100%')
          .margin({
            top: '48vp',
            bottom: '24vp'
          })
          .fontWeight(700)
          .fontSize('30fp')

        // 健康卡片网格
        Grid() {
          GridItem() {
            HealthCard({ data: heartRateData })
          }
          .columnStart(0)
          .columnEnd(1)

          ForEach(healthDataList, (item: HealthData) => {
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
    .backgroundColor('##F1F0F0')
  }
}
