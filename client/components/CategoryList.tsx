import React, {useEffect, useState} from 'react';

function CategoryList() {
    const [categories, setCategories] = useState<
    {id: string; name: string; category_name: string;
      date: Date; amount: number; created_at: Date}[] | string
    >("loading");

    useEffect(() => { /*local host*/
        fetch("http://localhost:3100/api/category")
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            setCategories(data);
        });
    }, []);
  return (
    <div>
      <table border = {2} align="center" cellPadding={15} cellSpacing={5}>
        <thead>
          <tr>
            <th>Id</th>
            <th>Category Name</th>
            <th>Created at</th>
          </tr>
        </thead>
        <tbody>
          {Array.isArray(categories) && categories.map((item, index)=>(
            <tr key={item.id}>
              <td>{index + 1}</td>
              <td>{item.category_name}</td>
              <td>{new Date(item.created_at).toLocaleString('en-US', {timeZoneName: 'short'})}</td>
            </tr>
            ))}
        </tbody>
      </table>
    </div>
  );
}
export default CategoryList;

