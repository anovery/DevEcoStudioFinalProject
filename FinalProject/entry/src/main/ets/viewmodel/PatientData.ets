// 康养用户数据管理
// 注意: 这是临时演示数据文件

// 康养用户信息接口
export interface PatientInfo {
  id: string;           // 用户ID
  name: string;         // 用户姓名
  relation: string;     // 亲属关系
  gender: string;       // 性别
  age: number;          // 年龄
}

// 模拟的康养用户数据列表 (演示用)
const PatientList: PatientInfo[] = [
  {
    id: '1',
    name: '张三',
    relation: '父亲',
    gender: '男',
    age: 75
  },
  {
    id: '2',
    name: '李四',
    relation: '母亲',
    gender: '女',
    age: 72
  },
  {
    id: '3',
    name: '王五',
    relation: '祖父',
    gender: '男',
    age: 85
  },
  {
    id: '4',
    name: '赵六',
    relation: '祖母',
    gender: '女',
    age: 82
  }
];

// 获取康养用户列表
// 这是预留的接口函数,当前返回硬编码的演示数据
// 对接用户档案模块时,修改此函数从用户档案API获取数据
export function getPatientList(): PatientInfo[] {
  // TODO: 从用户档案模块获取真实数据
  // 例如: return UserProfileModule.fetchPatients();
  return PatientList;
}
