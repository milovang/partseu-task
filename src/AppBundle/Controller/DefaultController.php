<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Catalog;
use AppBundle\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $catalogs = $this->getDoctrine()->getRepository(Catalog::class)->findAll();
        $categories = $this->getDoctrine()->getRepository(Category::class)->findAll();


        return $this->render('default/index.html.twig', [
            'catalogs' => $catalogs,
            'categories' => $categories,
        ]);
    }
}
