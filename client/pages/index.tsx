import React, {useEffect, useState} from 'react';
import TransactionList from "../components/TransactionList"
import CategoryList from '@/components/CategoryList';
import Title from "../components/Title";
function Index() {
  return (
    <div>
      <Title />
    <CategoryList/> <br/>
    <TransactionList/> <br />
    </div>
  );
}

export default Index;



