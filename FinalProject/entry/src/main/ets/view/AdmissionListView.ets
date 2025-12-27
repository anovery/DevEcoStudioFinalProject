// 入住申请列表视图组件
import { AdmissionItemType, AdmissionItemList } from '../viewmodel/AdmissionData';
import AdmissionItemCard from './AdmissionItemCard';

@Component
export default struct AdmissionListView {
  @StorageLink('admissionList') admissionList: AdmissionItemType[] = AdmissionItemList;
  onApplyClick?: () => void;  // 保留以保持接口兼容
  onItemClick?: (item: AdmissionItemType) => void;

  build() {
    Column() {
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
        .padding({ left: '12vp', right: '12vp', top: '12vp' })
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
    .layoutWeight(1)
  }
}
