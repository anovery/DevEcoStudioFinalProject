// 入住申请卡片组件
import { AdmissionItemType } from '../viewmodel/AdmissionData';

@Component
export default struct AdmissionItemCard {
  @Prop admissionItem: AdmissionItemType;
  onItemClick?: (item: AdmissionItemType) => void;

  // 根据审核状态返回对应的颜色
  getStatusColor(status: string): string {
    switch (status) {
      case '已通过':
        return '#52C41A';  // 绿色
      case '已拒绝':
        return '#FF4D4F';  // 红色
      case '待审核':
      default:
        return '#FA8C16';  // 橙色
    }
  }

  build() {
    Column() {
      // 第1行:康养用户姓名
      Row() {
        Text('康养用户：')
          .fontSize('14fp')
          .fontColor('#999999')
        Text(this.admissionItem.patientName)
          .fontSize('16fp')
          .fontWeight(700)
          .fontColor('#333333')
          .layoutWeight(1)
      }
      .width('100%')
      .margin({ bottom: '8vp' })

      // 第2行:机构名称
      Row() {
        Text('机构：')
          .fontSize('13fp')
          .fontColor('#999999')
        Text(this.admissionItem.organizationName)
          .fontSize('13fp')
          .fontColor('#666666')
          .layoutWeight(1)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .margin({ bottom: '6vp' })

      // 第3行:部门名称
      Row() {
        Text('部门：')
          .fontSize('13fp')
          .fontColor('#999999')
        Text(this.admissionItem.departmentName)
          .fontSize('13fp')
          .fontColor('#666666')
      }
      .width('100%')
      .margin({ bottom: '6vp' })

      // 第4行:房间名称
      Row() {
        Text('房间：')
          .fontSize('13fp')
          .fontColor('#999999')
        Text(this.admissionItem.roomName)
          .fontSize('13fp')
          .fontColor('#666666')
      }
      .width('100%')
      .margin({ bottom: '6vp' })

      // 第5行:申请时间
      Row() {
        Text('申请时间：')
          .fontSize('13fp')
          .fontColor('#999999')
        Text(this.admissionItem.applicationTime)
          .fontSize('13fp')
          .fontColor('#666666')
      }
      .width('100%')
      .margin({ bottom: '8vp' })

      // 第6行:审核状态
      Row() {
        Text('状态：')
          .fontSize('13fp')
          .fontColor('#999999')
        Text(this.admissionItem.status)
          .fontSize('14fp')
          .fontWeight(600)
          .fontColor(this.getStatusColor(this.admissionItem.status))
      }
      .width('100%')
    }
    .padding('16vp')
    .width('100%')
    .backgroundColor('#FFFFFF')
    .borderRadius('12vp')
    .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })
    .onClick(() => {
      if (this.onItemClick) {
        this.onItemClick(this.admissionItem);
      }
    })
  }
}
