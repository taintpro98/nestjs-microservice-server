

import { Observable, of } from "rxjs";
import { map, filter, switchMap } from "rxjs/operators";
import axios from "axios";
const fs = require("fs");

// const file$ = new Observable(subscriber => {
//   const fileStream = fs.createReadStream("test.txt");
//   console.log("fileStream", fileStream)
//   fileStream.on("data", (chunk: any) => subscriber.next(chunk));
//   fileStream.on("end", () => subscriber.complete());
//   fileStream.on("error", (err: any) => subscriber.error(err));
// });
// file$.subscribe(
//   (chunk: any) => console.log(chunk.toString()),
//   err => console.error(err),
//   () => console.log("Done!")
// );

// const request$ = new Observable(subscriber => {
//   axios
//     .get("https://nekoverse-testing-api-v2.nekoglobaldev.com/v1/shop/consumable-items")
//     .then(response => {
//       subscriber.next(response.data);
//       subscriber.next(response.data);
//       subscriber.next(response.data);
//       // subscriber.complete();
//     })
//     .catch(err => subscriber.error(err));
// });
// request$.subscribe(
//   data => console.log(data),
//   err => console.error(err),
//   () => console.log("Done!")
// );


const myObservable = new Observable(subscriber => {
  subscriber.next(3);
  subscriber.next(4);
  subscriber.next(5);
  subscriber.next(6);
});
const transformedObservable = myObservable.pipe(
  map((x: any) => x * 2),
  filter(x => x > 4)
);
transformedObservable.subscribe(x => console.log(x));


// const getUsers$ = of("https://nekoverse-testing-api-v2.nekoglobaldev.com/v1/shop/consumable-items").pipe(
//   switchMap(url => axios.get(url))
// );
// getUsers$.subscribe(response => console.log(response.data));
