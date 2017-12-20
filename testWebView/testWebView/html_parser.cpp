//
//  html_parser.cpp
//  testWebView
//
//  Created by admin on 12/12/2017.
//  Copyright © 2017 gome. All rights reserved.
//

#include "html_parser.hpp"

#include "gumbo/gumbo.h"

bool parse_hao123(const std::string& html)
{
    GumboOutput* output = gumbo_parse_with_options(&kGumboDefaultOptions, html.c_str(), html.length());
    if (output == nullptr)
        return false;
    
    GumboNode* root = output->root;
    if (root == nullptr)
        return false;
    
    const GumboVector* root_children = &root->v.element.children;
    GumboNode* head = NULL;
    for (int i = 0; i < root_children->length; ++i) {
        GumboNode* child = root_children->data[i];
        if (child->type == GUMBO_NODE_ELEMENT &&
            child->v.element.tag == GUMBO_TAG_HEAD) {
            head = child;
            break;
        }
    }
    
    gumbo_destroy_output(&kGumboDefaultOptions, output);
}
