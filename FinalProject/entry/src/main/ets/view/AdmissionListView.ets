// 入住申请列表视图组件
import { AdmissionItemType, AdmissionItemList } from '../viewmodel/AdmissionData';
import AdmissionItemCard from './AdmissionItemCard';

@Component
export default struct AdmissionListView {
  @StorageLink('admissionList') admissionList: AdmissionItemType[] = AdmissionItemList;
  onApplyClick?: () => void;
  onItemClick?: (item: AdmissionItemType) => void;

  build() {
    Column() {
      // 申请入住按钮
      Button('申请入住')
        .width('100%')
        .height('48vp')
        .fontSize('16fp')
        .fontWeight(600)
        .backgroundColor('#13C2C2')
        .borderRadius('24vp')
        .margin({ bottom: '16vp' })
        .onClick(() => {
          if (this.onApplyClick) {
            this.onApplyClick();
          }
        })

      // 入住申请列表
      if (this.admissionList.length > 0) {
        List({ space: 12 }) {
          ForEach(this.admissionList, (item: AdmissionItemType) => {
            ListItem() {
              AdmissionItemCard({
                admissionItem: item,
                onItemClick: this.onItemClick
              })
            }
          }, (item: AdmissionItemType) => item.id.toString())
        }
        .width('100%')
        .layoutWeight(1)
      } else {
        // 空状态提示
        Column() {
          Text('暂无入住申请记录')
            .fontSize('14fp')
            .fontColor('#999999')
            .margin({ top: '40vp' })
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Start)
      }
    }
    .width('100%')
    .height('100%')
    .padding('12vp')
  }
}
