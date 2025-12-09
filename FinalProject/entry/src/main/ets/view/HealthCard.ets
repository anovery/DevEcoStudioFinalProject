//健康信息卡片组件

export interface HealthData {
  icon: Resource; // 图标
  label: string; // 标签（如：心率、血氧等）
  value: string; // 数值
  unit: string; // 单位
  status: 'normal' | 'warning' | 'danger'; // 状态：正常、警告、危险
}

@Component
export struct HealthCard {
  @Prop data: HealthData;

  private getStatusColor(): string {
    switch (this.data.status) {
      case 'normal':
        return '#0a59f7'; // 蓝色 - 正常
      case 'warning':
        return '#ff7500'; // 橙色 - 警告
      case 'danger':
        return '#ff3d3d'; // 红色 - 危险
      default:
        return '#0a59f7';
    }
  }

  private getStatusBackground(): string {
    switch (this.data.status) {
      case 'normal':
        return '#e8f3ff'; // 浅蓝色
      case 'warning':
        return '#fff3e0'; // 浅橙色
      case 'danger':
        return '#ffe0e0'; // 浅红色
      default:
        return '#e8f3ff';
    }
  }

  build() {
    Column() {
      // 卡片上半部分 - 图标和状态指示
      Row() {
        SymbolGlyph(this.data.icon)
          .fontSize('32fp')
          .fontColor([this.getStatusColor()])
        Blank()
        Circle()
          .width('12vp')
          .height('12vp')
          .fill(this.getStatusColor())
      }
      .width('100%')
      .padding({ bottom: '16vp' })

      // 卡片中间部分 - 标签
      Text(this.data.label)
        .width('100%')
        .fontSize('14fp')
        .fontColor('#66000000')
        .margin({ bottom: '8vp' })

      // 卡片下半部分 - 数值和单位
      Row({ space: 4 }) {
        Text(this.data.value)
          .fontSize('28fp')
          .fontWeight(700)
          .fontColor(this.getStatusColor())
        Text(this.data.unit)
          .fontSize('14fp')
          .fontColor('#99000000')
          .alignSelf(ItemAlign.End)
      }
      .width('100%')
      .height('44vp')
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .padding('16vp')
    .backgroundColor(this.getStatusBackground())
    .borderRadius('12vp')
    .border({
      width: '2px',
      color: this.getStatusColor(),
      radius: '12vp',
      style: BorderStyle.Solid
    })
  }
}
