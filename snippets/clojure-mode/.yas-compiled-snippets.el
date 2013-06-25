;;; Compiled snippets and support files for `clojure-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'clojure-mode
                     '(("compojure" "\n$0\n      (:use compojure.core\n            [hiccup.middleware :only (wrap-base-url)]\n            [ring.adapter.jetty :only [run-jetty]]\n            [hiccup core page])\n      (:require [compojure.route :as route]\n            [compojure.handler :as handler]\n            [compojure.response :as response]))\n\n(declare $1)\n\n(defn server [] (run-jetty #'$1 {:port 8080 :join? false}))\n\n(defn index-page []\n  (html5\n    [:head\n      [:title \"Hello World\"]\n      (include-css \"/css/style.css\")]\n    [:body\n      [:h1 \"Hello World\"]]))\n\n\n(defroutes $1-routes\n  (GET \"/\" [] (index-page))\n  (GET \"/hi\" [name] (str \"Hi there \" name)))\n\n(def $1\n  (-> (handler/site $1-routes)\n      (wrap-base-url)))\n" "Compojure App" nil nil nil nil nil nil)
                       ("compojure_deps" ":dependencies [[org.clojure/clojure \"1.$1.0\"]\n               [compojure \"1.1.1\"]\n               [ring/ring-jetty-adapter \"1.0.2\"]\n               [hiccup \"1.0.0\"]]" "Compojure Dependencies" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Mon Jun 24 20:09:34 2013
