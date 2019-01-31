<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Catalog;
use AppBundle\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;

class CatalogController extends Controller
{

    public function getByCategory($id, Request $request){

        $category = $this->getDoctrine()->getRepository(Category::class)->findOneBy([ "id" => $id ]);
        $catalogs = $category->getCatalogs();


        return $this->render('category/index.html.twig',[
            'category' => $category,
            'catalogs' => $catalogs,
        ]);


    }

    public function getByCategories(Request $request){

        $unique = [];
        $categories = [];
        $requestedData = $request->get("filter_id");

        if(!empty($requestedData)) {
            foreach ($requestedData as $data) {

                $categories = $this->getDoctrine()->getRepository(Category::class)->findById([$data]);
                foreach ($categories as $category) {
                    if ($category->getCatalogs()) {
                        $catalogs = $category->getCatalogs();
                        foreach ($catalogs as $catalog) {
                            $cat[] = $catalog;
                            $unique = array_unique($cat, SORT_REGULAR);
                        }
                    }
                }
            }
        }


        return $this->render('category/filters.html.twig',[
            'categories' => $categories,
            'catalogs' => $unique,
        ]);


    }


    public function searchByName(Request $request){

        $requestedData =  $request->get("find_name");
        $results = $this->getDoctrine()->getRepository(Catalog::class)->findBy([ "name" => $requestedData ]);


        return $this->render('catalogs/search.html.twig',[
            'results' => $results,
            'requestedData' => $requestedData,
        ]);


    }


}
