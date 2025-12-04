//首页组件

@Component
export default struct Home {

  pathStack: NavPathStack = AppStorage.get("pathStack") as NavPathStack;//跳转页面相关 不要删
  Consultation(result: boolean): void {
    //跳转页面相关 不要删
    this.pathStack.pushPathByName('Consultation', null);
  }
  ServiceOrders(result: boolean): void {
    //跳转页面相关 不要删
    this.pathStack.pushPathByName('ServiceOrders', null);
  }
  ServiceProcurement(result: boolean): void {
    //跳转页面相关 不要删
    this.pathStack.pushPathByName('ServiceProcurement', null);
  }
  Admission(result: boolean): void {
    //跳转页面相关 不要删
    this.pathStack.pushPathByName('Admission', null);
  }

  build() {
    NavDestination(){
      Column() {
        Text('首页')
          .width('100%')
          .margin({
            top: '48vp',
            bottom: '12vp'
          })
          .fontWeight(700)
          .fontSize('26fp')

        Button('问诊记录')
          .width('50%')
          .height('100vp')
          .fontSize('16fp')
          .backgroundColor('#007DFF')
          .onClick(() => {
            this.Consultation(true);
          })


        Button('服务订单')
          .width('50%')
          .height('100vp')
          .fontSize('16fp')
          .backgroundColor('#007DFF')
          .onClick(() => {
            this.ServiceOrders(true);
          })

        Button('服务采购')
          .width('50%')
          .height('100vp')
          .fontSize('16fp')
          .backgroundColor('#007DFF')
          .onClick(() => {
            this.ServiceProcurement(true);
          })
        Button('入住申请')
          .width('50%')
          .height('100vp')
          .fontSize('16fp')
          .backgroundColor('#007DFF')
          .onClick(() => {
            this.Admission(true);
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
    }

  }
}