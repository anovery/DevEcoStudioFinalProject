// User Profile constants and initial data
import { UserInfo, UserDataSource } from './UserModel';
import { Prompt } from '@kit.ArkUI';

export const MAX_OFFSET_Y = 60;
export const REFRESH_TIME = 1500;
export const LIST_ITEM_SPACE = 10;
export const NORMAL_FONT_SIZE = 14;
export const TOTAL_MAX_DATA = 10;

export const ALL_MOCK_DATA: UserInfo[] = [
  {
    name: '赵智晟',
    gender: '男性',
    relation: '其他',
    birthday: '1985-01-30',
    idCard: '42103988475898890',
    address: '湖北武汉武昌区明珠家园305',
    job: '外卖员'
  },
  {
    name: '王国栋',
    gender: '女性',
    relation: '本人',
    birthday: '1995-01-30',
    idCard: '42103988475898891',
    address: '湖北武汉武昌区明珠家园305',
    job: '老师'
  },
  {
    name: '刘菲',
    gender: '女性',
    relation: '子女',
    birthday: '2000-05-10',
    idCard: '42103988475898892',
    address: '湖北武汉洪山区光谷天地',
    job: '设计师'
  }
];

export const INIT_USER_DATA: UserInfo[] = ALL_MOCK_DATA.slice(0, 3);

// 新增用户写入列表
export function addNewUserToList(
  newUser: UserInfo,
  dataSource: UserDataSource,
  setIsEnd: (flag: boolean) => void
): void {
  const existIds = dataSource.getAll().map((user: UserInfo) => user.idCard);
  if (existIds.includes(newUser.idCard)) {
    Prompt.showToast({ message: `用户已存在，身份证号：${newUser.idCard}` });
    return;
  }

  if (dataSource.totalCount() >= TOTAL_MAX_DATA) {
    setIsEnd(true);
    return;
  }

  dataSource.addData([newUser]);
  setIsEnd(false);
}
