//健康资讯详情界面
//HealthListDetail()的入口函数
@Builder
export function HealthListDetailBuilder() {
  HealthListDetail()
}

@Component
struct HealthListDetail{
  pathStack: NavPathStack = AppStorage.get("pathStack") as NavPathStack;//跳转页面相关 不要删
  build() {
    NavDestination() {
      Column() {
        //标题部分
        Row(){
          Button(){
            Image($r('app.media.arrow_health'))
              .width(30)
              .height(30)

          }.backgroundColor('#00000000')
          .margin({left:'5vp'})
          .onClick(()=>{
              this.pathStack.pop()
          })
          Row(){
            Text('健康详情页')
              .height('60vp')
              .fontWeight(220)//字体粗细
              .fontSize('20fp')//字体大小
              .backgroundColor('#0021deb4')
              //.backgroundColor('#ffd41c1c')
              .fontColor('#FFFFFF')
          }
          .margin({left:'110vp'})


        }.width('100%')

        //视频
        Column(){

        }.width('100%')
        .backgroundColor('#FFFFFF')
        .layoutWeight(1)

      }
      .width('100%')
      .height('100%')
      .backgroundColor('#d821deb4')
      //.backgroundColor('#fff1f0f0')

    }.hideTitleBar(true) //如果为true就没有返回的箭头
    .backgroundColor('#ff21deb4')

  }
}