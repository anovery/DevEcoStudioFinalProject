//入住申请页面

//Admission()的入口函数
@Builder
export function AdmissionBuilder() {
  Admission()
}

@Component
struct Admission{
  build() {
    NavDestination() {
      Column() {
        Text('入住申请')
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