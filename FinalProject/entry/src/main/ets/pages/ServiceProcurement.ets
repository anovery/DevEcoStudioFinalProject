//服务采购页面
import { ServiceItemType, IServiceItemData } from '../viewmodel/ServiceProcurementData';
import ServiceItemListView from '../view/ServiceItemListView';

//ServiceProcurement()的入口函数
@Builder
export function ServiceProcurementBuilder() {
  ServiceProcurement()
}

@Component
struct ServiceProcurement {
  pathStack: NavPathStack = AppStorage.get("pathStack") as NavPathStack;

  // 处理服务项目点击事件
  handleItemClick(item: ServiceItemType): void {
    // 只传递服务ID，目标页面根据ID从ServiceItemList查找完整数据
    this.pathStack.pushPathByName('ServiceDetail', item.id);
  }

  build() {
    NavDestination() {
      Column() {
        // 页面标题
        Text('服务采购')
          .width('100%')
          .padding({ left: '16vp', top: '16vp', bottom: '12vp' })
          .fontWeight(700)
          .fontSize('24fp')
          .fontColor('#333333')

        // 服务项目列表
        ServiceItemListView({
          onItemClick: (item: ServiceItemType) => {
            this.handleItemClick(item);
          }
        })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
    }
    .hideTitleBar(false) //如果为true就没有返回的箭头
  }
}