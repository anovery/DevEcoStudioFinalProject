//服务采购页面

//ServiceProcurement()的入口函数
@Builder
export function ServiceProcurementBuilder() {
  ServiceProcurement()
}
@Component
struct ServiceProcurement{
  build() {
    NavDestination() {
      Column() {
        Text('服务采购')
          .width('100%')
          .margin({
            top: '48vp',
            bottom: '12vp'
          })
          .fontWeight(700)
          .fontSize('26fp')
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
    }.hideTitleBar(false) //如果为true就没有返回的箭头
  }
}