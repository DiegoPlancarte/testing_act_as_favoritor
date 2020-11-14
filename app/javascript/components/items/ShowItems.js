import React, { useState, useEffect } from 'react';

const ShowItems = (props) => {

  const [ items, setItems ] = useState([])
  const [ isLoading, setIsLoading ] = useState(null);
  const [ error, setError ] = useState(null);

  useEffect(()=> {
    setIsLoading(true)
    fetch('/items')
      .then((response)=>{
        if(response.status === 200){
            return(response.json())
          }
      })
      .then((data) => {
        setItems(data);
        setIsLoading(false)
      })
      .catch((err) => {
        if(err) {
          setIsLoading(true)
          setError(err)
        }
      })
  }, []);

  console.log(props)
  console.log(isLoading)
  console.log(error)

  if (isLoading) {
    return <div>Loading...</div>
  }  

  return ( 
    <React.Fragment>
      { items.map((v,i) => {
        return(
          <div key={i}>
            {/* <Link to={`/bloginfo/${v.id}`}>{v.title}</Link> */}
            <p>{v.title}</p>
            <p>{v.user_id}</p>
          </div>
        )
      })}
    </React.Fragment>
  );
}

export default ShowItems;