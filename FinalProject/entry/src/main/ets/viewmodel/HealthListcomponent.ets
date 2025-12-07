//健康资讯List部分的组件

import { HealthResourcesItemType } from '../viewmodel/MainViewModel';
import { ListDataSource } from '../viewmodel/HealthListData';

@Component
export default struct HealthResourceList {
  @Provide HealthResourceListData: ListDataSource = new ListDataSource();
  private startTouchOffsetY: number = 0;
  private endTouchOffsetY: number = 0;

  build() {
    Row() {
      List({ space: 16 }) {
        LazyForEach(this.HealthResourceListData, (item: HealthResourcesItemType) => {
          ListItem() {
              Button() {
              Column() {
                Image(item?.ResourcePhoto)
                  .width('100%')
                  .objectFit(ImageFit.Contain)
                  //.height('150vp')
                  .borderRadius('10vp')
                  .margin({top:'0vp'})
                Row(){
                  Row(){
                    Image($r('app.media.health_resource_title'))
                      .height('24vp')
                      .objectFit(ImageFit.Contain)

                    Text(item?.ResourceName)
                      .fontSize('18vp')
                      .margin({left:'8vp'})
                  }.margin({top:'10vp'})
                  .alignItems(VerticalAlign.Center)
                  .width('100%')
                }.backgroundColor('#FFFFFF')
                  .flexGrow(1)


              }.width('100%')
                .height('100%')
              //.backgroundColor('#FFFFFF')
            }.width('95%')
              .height('258vp')
              .backgroundColor('#00f1f0f0')
              .borderRadius('10vp')
              .margin({left:'10vp'})

          }
          .onTouch((event?: TouchEvent) => {
            if (event === undefined) {
              return;
            }
            switch (event.type) {
              case TouchType.Down:
                this.startTouchOffsetY = event.touches[0].y;
                break;
              case TouchType.Up:
                this.startTouchOffsetY = event.touches[0].y;
                break;
              case TouchType.Move:
                if (this.startTouchOffsetY - this.endTouchOffsetY > 0) {
                  this.HealthResourceListData.pushData();
                }
                break;
            }
          })
        })
      }
      .width('100%')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }
}