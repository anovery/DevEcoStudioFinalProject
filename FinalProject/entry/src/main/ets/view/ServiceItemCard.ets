// 服务项目卡片组件
import { ServiceItemType } from '../viewmodel/ServiceProcurementData';

@Component
export default struct ServiceItemCard {
  @Prop serviceItem: ServiceItemType;
  onItemClick?: (item: ServiceItemType) => void;

  build() {
    Column() {
      // 顶部图片
      Image(this.serviceItem.servicePhoto)
        .width('100%')
        .height('140vp')
        .objectFit(ImageFit.Cover)
        .borderRadius({ topLeft: '12vp', topRight: '12vp' })

      // 下方信息区域
      Column() {
        // 第1行：服务名称
        Text(this.serviceItem.serviceName)
          .fontSize('16fp')
          .fontWeight(700)
          .fontColor('#333333')
          .width('100%')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        // 第2行：服务机构
        Row() {
          Text('机构：')
            .fontSize('13fp')
            .fontColor('#999999')
          Text(this.serviceItem.serviceOrganization)
            .fontSize('13fp')
            .fontColor('#666666')
            .layoutWeight(1)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .width('100%')
        .margin({ top: '8vp' })

        // 第3行：服务类型
        Row() {
          Text('类型：')
            .fontSize('13fp')
            .fontColor('#999999')
          Text(this.serviceItem.serviceType)
            .fontSize('13fp')
            .fontColor('#666666')
        }
        .width('100%')
        .margin({ top: '6vp' })

        // 第4行：服务价格
        Row() {
          Text('价格：')
            .fontSize('13fp')
            .fontColor('#999999')
          Row() {
            Text('¥')
              .fontSize('12fp')
              .fontColor('#FF6B6B')
              .fontWeight(500)
            Text(this.serviceItem.servicePrice.toString())
              .fontSize('18fp')
              .fontColor('#FF6B6B')
              .fontWeight(700)
            Text(`/${this.serviceItem.serviceUnit}`)
              .fontSize('12fp')
              .fontColor('#999999')
              .margin({ left: '2vp' })
          }
        }
        .width('100%')
        .margin({ top: '6vp' })
      }
      .padding('12vp')
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .backgroundColor('#FFFFFF')
    .borderRadius('12vp')
    .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })
    .onClick(() => {
      if (this.onItemClick) {
        this.onItemClick(this.serviceItem);
      }
    })
  }
}
