//
//  main.m
//  SAAlgorithm
//
//  Created by Smart-AI on 09/01/2018.
//  Copyright © 2018 Smart-AI. All rights reserved.
//

#import <Foundation/Foundation.h>

int findBySeq(int *listSeq, int listLength, int keyData);
int binSearch(int *sortedSeq, int seqLength, int keyData);

int main(int argc, const char * argv[]) {
    /*顺序查找
    int testData[5] = {34, 35, 26, 89, 56};
    int retData = findBySeq(testData, 5, 89);
    printf("retData:%d\n", retData);
    */
    
    int array[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    int location;
    int tartget = 4;
    location = binSearch(array, 9, tartget);
    printf("%d\n", location);
    
    return 0;
}

/*
 顺序查找
 复杂度分析：
 查找成功时的平均查找长度为：（假设每个数据元素的概率相等） ASL = 1/n(1+2+3+…+n) = (n+1)/2 ;
 当查找不成功时，需要n+1次比较，时间复杂度为O(n);
*/

int findBySeq(int *listSeq, int listLength, int keyData) {
    int length = listLength;
    for (int i = 0; i < length; i++) {
        if (listSeq[i] == keyData) {
            return i;
        }
    }
    return 0;
}

/*
 二分查找(折半查找)
 元素必须是有序的，如果是无序的则要先进行排序操作
 复杂度分析：最坏情况下，关键词比较次数为log2(n+1)，且期望时间复杂度为O(log2n);
 */
int binSearch(int *sortedSeq, int seqLength, int keyData) {
    int low = 0, mid, high = seqLength -1;
    while (low <= high) {
        mid = (low + high) /2;
        if (keyData < sortedSeq[mid]) {
            high = mid -1;
        } else if (keyData > sortedSeq[mid]) {
            low = mid + 1;
        } else {
            return mid;
        }
    }
    return -1;
}

