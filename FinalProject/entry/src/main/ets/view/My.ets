//我的 组件


@Component
export default struct My {
  pathStack: NavPathStack = AppStorage.get("pathStack") as NavPathStack;//跳转页面相关 不要删
  Consultation(result: boolean): void {
    //跳转页面相关 不要删
    this.pathStack.pushPathByName('Consultation', null);
  }
  ServiceOrders(result: boolean): void {
    //跳转页面相关 不要删
    this.pathStack.pushPathByName('ServiceOrders', null);
  }
  Admission(result: boolean): void {
    //跳转页面相关 不要删
    this.pathStack.pushPathByName('Admission', null);
  }

  build() {
    NavDestination() {

      Column() {
        Text('我的')
          .width('100%')
          .margin({
            top: '48vp',
            bottom: '12vp'
          })
          .fontWeight(700)
          .fontSize('26fp')

        Button('问诊记录')
          .width('50%')
          .height('80vp')
          .fontSize('16fp')
          .backgroundColor('#007DFF')
          .onClick(() => {
            this.Consultation(true);
          })//这个onclick页面跳转逻辑不能删 最后可以不用Button实现这个键 但是用了其他组件也要补这个逻辑


        Button('服务订单')
          .width('50%')
          .height('80vp')
          .fontSize('16fp')
          .backgroundColor('#007DFF')
          .onClick(() => {
            this.ServiceOrders(true);
          })//这个onclick页面跳转逻辑不能删

        Button('入住申请')
          .width('50%')
          .height('80vp')
          .fontSize('16fp')
          .backgroundColor('#007DFF')
          .onClick(() => {
            this.Admission(true);
          })//这个onclick页面跳转逻辑不能删

        Button('退出登录')
          .width('50%')
          .height('80vp')
          .fontSize('16fp')
          .backgroundColor('#007DFF')
          .onClick(() => {
            this.pathStack.clear()
          })//这个onclick页面跳转逻辑不能删

      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
    }
  }
}