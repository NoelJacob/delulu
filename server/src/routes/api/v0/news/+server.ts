import {error} from '@sveltejs/kit';
import type {RequestHandler} from "@sveltejs/kit";

export const GET: RequestHandler<{
  page: string;
  num: string
}> = ({params}) => {
  const page = Number(params.page);
  const num = Number(params.num);
  const articles = [
    {
      title: "Blah",
      url: "http://localhost:8080",
      image_url: "https://localhost:8080/image",
    }
  ];
  return new Response(
    JSON.stringify(articles),
    {
      headers: {
        'Content-Type': 'application/json'
      }
    }
  );
}
